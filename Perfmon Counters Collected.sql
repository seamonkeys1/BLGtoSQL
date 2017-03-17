declare @ServerName varchar(50) = 'dbase'

select 
	ServerName, CounterInstance
from
	dbo.PerfmonImport
where
	ServerName = @ServerName
group by
	ServerName, CounterInstance
order by
	ServerName, CounterInstance