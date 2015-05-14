<cfparam name="args.commentsAllowed" type="boolean" default="true" />
<cfoutput>
<li class="comment depth-1 with-avatars" id="comment-#comment.getCommentID()#">
	<div class="wrap<cfif args.commentsAllowed > tiptrigger</cfif>">
		<div class="avatar">
			<a class="gravatar" <cfif len( comment.getAuthorURL() ) >href="<cfif NOT findnocase("http",comment.getAuthorURL())>http://</cfif>#comment.getAuthorURL()#"</cfif> >#cb.quickAvatar(author=comment.getAuthorEmail(),size=64)#</a>
		</div>
		<div class="details regularcomment<!--- TODO: admincomment --->">
			<p class="head">
				<span class="info">
					<a href="##comment-#comment.getCommentId()#">###_counter#</a> by
					<cfif len( comment.getAuthorURL() ) >
						<a id="commentauthor-#comment.getCommentId()#" href="<cfif NOT findnocase("http",comment.getAuthorURL())>http://</cfif>#comment.getAuthorURL()#" rel="external nofollow">
					<cfelse>
						<strong id="commentauthor-#comment.getCommentId()#">
					</cfif>
					#comment.getAuthor()#
					<cfif !len( comment.getAuthorURL() ) >
						</strong>
					<cfelse>
						</a>
					</cfif>
					- #comment.getDisplayCreatedDate()#
				</span>
			</p>
			<div class="text">
				<div id="commentbody-#comment.getCommentId()#">#comment.getDisplayContent()#</div>
			</div>
		</div>
		<cfif args.commentsAllowed >
			<div class="act tip">
				<span class="button reply">
					<a title="Reply" href="javascript:void(0);" onclick="MGJS_CMT.quote('commentauthor-#comment.getCommentId()#', 'comment-#comment.getCommentId()#', 'commentbody-#comment.getCommentId()#', 'comment');"><span><span>Reply</span></span></a>
				</span>
			</div>
		</cfif>
		<span class="editlink"></span>
	</div>
</li>
</cfoutput>