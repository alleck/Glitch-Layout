<cfoutput>
#cb.event("cbui_preIndexDisplay")#
<cfif cb.categoryFilterExists() >
	<h1 class="pagetitle">Entries Tagged as "#cb.getCategoryFilter()#"</h1>
<cfelseif cb.searchTermExists() >
	<h1 class="pagetitle">Search Results for "#cb.getSearchTerm()#"</h1>
</cfif>
#cb.quickEntries()#
<div class="navigation" id="pagenavi">
	#cb.quickPaging()#
	<div class="clear"></div>
</div>
#cb.event("cbui_postIndexDisplay")#
</cfoutput>