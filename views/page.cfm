<cfoutput>
#cb.event("cbui_prePageDisplay")#
<div id="post-#cb.getCurrentPage().getContentID()#" class="page">
	<h2 class="left">#cb.getCurrentPage().getTitle()#</h2>
	<div class="clear"></div>
	<div class="entry clearfix">
		#cb.getCurrentPage().renderContent()#
	</div>
</div>
<cfif ( cb.isCommentsEnabled( cb.getCurrentPage() ) OR cb.getCurrentPage().getNumberOfApprovedComments() ) AND !cb.isPrintFormat() >
	#html.anchor(name="comments")#
	<div id="secondary-tabs">
		<ul class="menu">
			<li><a href="##tab-1" class="current"><span><span>Comments (#cb.getCurrentPage().getNumberOfApprovedComments()#)</span></span></a></li>
		</ul>
		<div id="tab-1">
			<cfif cb.getCurrentPage().getNumberOfApprovedComments() >
				<ol id="comments">
					#cb.quickComments(args={commentsAllowed=cb.isCommentsEnabled( cb.getCurrentPage() )})#
				</ol>
			<cfelseif !cb.getCurrentPage().getNumberOfApprovedComments() AND cb.isCommentsEnabled( cb.getCurrentPage() ) >
				<p>No comments yet.</p>
			</cfif>
			<cfif cb.getCurrentPage().getNumberOfApprovedComments() AND !cb.isCommentsEnabled( cb.getCurrentPage() ) >
				<p>Comments are closed.</p>
			<cfelseif cb.isCommentsEnabled( cb.getCurrentPage() ) >
				#cb.quickView("_commentform")#
			</cfif>
		</div>
	</div>
</cfif>
#cb.event("cbui_postPageDisplay")#
</cfoutput>