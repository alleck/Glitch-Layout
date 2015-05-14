<cfoutput>
#cb.event("cbui_preEntryDisplay")#
<div id="post-#cb.getCurrentEntry().getContentID()#" class="post hentry">
	<h2><a href="#cb.linkEntry(cb.getCurrentEntry())#" rel="bookmark" title="Permanent Link to #cb.getCurrentEntry().getTitle()#">#cb.getCurrentEntry().getTitle()#</a></h2>
	<div class="postheader">
		<div class="postinfo">
			<p>
				Posted by #cb.getCurrentEntry().getAuthorName()#
				<cfif cb.getCurrentEntry().hasCategories() >
					in #cb.quickCategoryLinks(cb.getCurrentEntry())#
				</cfif>
				on #dateFormat( cb.getCurrentEntry().getDisplayPublishedDate(), "mmmm d, yyyy" )#
			</p>
		</div>
	</div>
	<div class="entry">
		<div class="postbody entry clearfix">
			#cb.getCurrentEntry().renderContent()#
		</div>
		<div class="clear"></div>
	</div>
</div>
<cfif ( cb.isCommentsEnabled( cb.getCurrentEntry() ) OR cb.getCurrentEntry().getNumberOfApprovedComments() ) AND !cb.isPrintFormat() >
	#html.anchor(name="comments")#
	<div id="secondary-tabs">
		<ul class="menu">
			<li><a href="##tab-1" class="current"><span><span>Comments (#cb.getCurrentEntry().getNumberOfApprovedComments()#)</span></span></a></li>
		</ul>
		<div id="tab-1">
			<cfif cb.getCurrentEntry().getNumberOfApprovedComments() >
				<ol id="comments">
					#cb.quickComments(args={commentsAllowed:cb.isCommentsEnabled( cb.getCurrentEntry() )})#
				</ol>
			<cfelseif !cb.getCurrentEntry().getNumberOfApprovedComments() AND cb.isCommentsEnabled( cb.getCurrentEntry() ) >
				<p>No comments yet.</p>
			</cfif>
			<cfif cb.getCurrentEntry().getNumberOfApprovedComments() AND !cb.isCommentsEnabled( cb.getCurrentEntry() ) >
				<p>Comments are closed.</p>
			<cfelseif cb.isCommentsEnabled( cb.getCurrentEntry() ) >
				#cb.quickView("_commentform")#
			</cfif>
		</div>
	</div>
</cfif>
#cb.event("cbui_postEntryDisplay")#
</cfoutput>