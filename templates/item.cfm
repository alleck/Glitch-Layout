<cfoutput>
<div class="post hentry" id="post-#item.getContentID()#">
	<h2><a href="#cb.linkContent(item)#" rel="bookmark" title="Permanent Link to #item.getTitle()#">#item.getTitle()#</a></h2>
	<div class="postheader">
		<div class="postinfo">
			<p>
				<cfif item.getContentType() EQ "Entry" >
					Posted by #item.getAuthorName()#
				<cfelse>
					Created
				</cfif>
				<cfif item.hasCategories() >
					in #cb.quickCategoryLinks(item)#
				</cfif>
				on #dateFormat( item.getDisplayPublishedDate(), "mmmm d, yyyy" )#
			</p>
		</div>
	</div>
	<div class="postbody entry clearfix">
		<cfif item.hasExcerpt() >
			#item.renderExcerpt()#
			<div class="post-more">
				<p><a href="#cb.linkEntry(item)#">Read More...</a></p>
			</div>
		<cfelse>
			#item.renderContent()#
		</cfif>
	</div>
	<cfif !cb.isPrintFormat() AND item.getAllowComments() >
		<p class="postcontrols">
			<a class="<cfif !item.getNumberOfApprovedComments() >no </cfif>comments" href="#cb.linkEntry(item)###comments" title="Comment on #item.getTitle()#">
				<cfif item.getNumberOfApprovedComments() >
					#item.getNumberOfApprovedComments()# Comment<cfif item.getNumberOfApprovedComments() GT 1 >s</cfif>
				<cfelse>
					No Comments
				</cfif>
			</a>
		</p>
	</cfif>
	<div class="clear"></div>
</div>
</cfoutput>