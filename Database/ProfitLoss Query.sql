SELECT UserName, PanNo,convert(varchar,Folio.AsOnDate, 3) as [Investment Date],	

	Folio.Holding - c.Qty as [Qty], 
	( select dbo.GetWeekAvgVwap(Folio.AsOnDate))  as [Apox VWP price],Folio.Holding ,
	case when (Folio.Holding -c.Qty =0)
	Then ( prevVwap.vwap * prevHolding.Holding )
	else 
	(prevVwap.vwap * prevHolding.Holding ) + (Folio.Holding *isnull(Series.vwap,0))
	end as [Investment value]	,

	(Folio.Holding *isnull(Series.vwap,0)) - (prevVwap.vwap * prevHolding.Holding ) + (Folio.Holding *isnull(Series.vwap,0)) as [Profit/Loss]
	from 
	Folio join [User] on Folio.UserID=[User].ID
	
cross apply (select isnull(Cast((select  Holding from Folio F2 where F2.UserID=10  and F2.AsOnDate=
	(select max(AsOnDate) from Folio F3 where F3.AsOnDate <Folio.AsOnDate and Folio.UserID=10))as decimal(10,0)),0) as [Qty]
) as c
cross apply  (select S4.vwap from Folio S2  join Series S4  on S2.AsOnDate=S4.AsOnDate and  S2.UserID=10 and S2.AsOnDate
=(select max(AsOnDate) from Folio S3 where S3.AsOnDate <Folio.AsOnDate and S3.UserID=10))  as prevVwap
cross apply  (select F2.Holding from Folio F2  where  F2.UserID=10 and F2.AsOnDate
=(select max(AsOnDate) from Folio F3 where F3.AsOnDate <Folio.AsOnDate and F3.UserID=10))  as prevHolding
left outer join Series on Folio.AsOnDate= Series.AsOnDate 
	where Folio.UserID= 10 order by Folio.AsOnDate