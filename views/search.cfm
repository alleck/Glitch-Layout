<cfoutput>
#cb.event("cbui_prePageDisplay")#

<h1 class="pagetitle">Search Results for "#cb.getSearchTerm()#"</h1>

#html.startForm( name="searchForm", action=cb.linkContentSearch() )#
	#html.textField( name="q", size="55", value=htmlEditFormat( cb.getSearchTerm() ) )#
	#html.submitButton( name="searchSubmitButton", value="Search" )#
#html.endForm()#

#renderView(view="fusion/templates/item",collection=prc.searchResults.getResults(),collectionAs="item")#

<div class="navigation" id="pagenavi">
	#cb.quickSearchPaging()#
	<div class="clear"></div>
</div>

#cb.event("cbui_postPageDisplay")#
</cfoutput>