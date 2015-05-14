<cfoutput>
#cb.event("cbui_preArchivesDisplay")#
<cfif cb.getDayFilter() >
	<h1 class="pagetitle">Entries for day: #dateFormat( createDate( cb.getYearFilter(), cb.getMonthFilter(), cb.getDayFilter() ), "mmmm d, yyyy" )#</h1>
<cfelseif cb.getMonthFilter() >
	<h1 class="pagetitle">Entries for month: #dateFormat( createDate( cb.getYearFilter(), cb.getMonthFilter(), 1 ), "mmmm, yyyy" )#</h1>
<cfelseif cb.getYearFilter() >
	<h1 class="pagetitle">Entries for year: #cb.getYearFilter()#</h1>
</cfif>
#cb.quickEntries()#
<div class="navigation" id="pagenavi">
	#cb.quickPaging()#
	<div class="clear"></div>
</div>
#cb.event("cbui_postArchivesDisplay")#
</cfoutput>