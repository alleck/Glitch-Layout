<cfoutput>
<cfif category.getNumberOfEntries() >
	<li class="cat-item cat-item-#category.getCategoryId()#">
		<a href="#cb.linkCategory( category )#" title="View all posts filed under #category.getCategory()#"><span>#category.getCategory()# (#category.getNumberOfEntries()#)</span></a>
		<a class="rss tip" href="#cb.linkRSS( category )#" title="RSS feed for all posts filed under #category.getCategory()#"></a>
	</li>
</cfif>
</cfoutput>