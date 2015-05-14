<cfoutput>
<div class="post hentry" id="post-#entry.getContentID()#">
	<h2><a href="#cb.linkEntry(entry)#" rel="bookmark" title="Permanent Link to #entry.getTitle()#">#entry.getTitle()#</a></h2>
	<div class="postheader">
		<div class="postinfo">
			<p>
				Posted by #entry.getAuthorName()#
				<cfif entry.hasCategories() >
					in #cb.quickCategoryLinks(entry)#
				</cfif>
				on #dateFormat( entry.getDisplayPublishedDate(), "mmmm d, yyyy" )#
			</p>
		</div>
	</div>
	<div class="postbody entry clearfix">
		<cfif entry.hasExcerpt() >
			#entry.renderExcerpt()#
			<div class="post-more">
				<p><a href="#cb.linkEntry(entry)#">Read More...</a></p>
			</div>
		<cfelse>
			#entry.renderContent()#
		</cfif>
	</div>
	<cfif !cb.isPrintFormat() AND entry.getAllowComments() >
		<p class="postcontrols">
			<a class="<cfif !entry.getNumberOfApprovedComments() >no </cfif>comments" href="#cb.linkEntry(entry)###comments" title="Comment on #entry.getTitle()#">
				<cfif entry.getNumberOfApprovedComments() >
					#entry.getNumberOfApprovedComments()# Comment<cfif entry.getNumberOfApprovedComments() GT 1 >s</cfif>
				<cfelse>
					No Comments
				</cfif>
			</a>
		</p>
	</cfif>
	<div class="clear"></div>
</div>
</cfoutput>