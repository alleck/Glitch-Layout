<cfoutput>
<div id="respond">
	<form action="#cb.isEntryView() ? cb.linkCommentPost( cb.getCurrentEntry() ) : cb.linkCommentPost( cb.getCurrentPage() )#" method="post" id="commentform" name="commentform" novalidate="novalidate">
		#cb.event("cbui_preCommentForm")#
		#getPlugin("MessageBox").renderit()#
		<input type="hidden" name="contentId" value="#cb.isEntryView() ? cb.getCurrentEntry().getContentId() : cb.getCurrentPage().getContentId()#" />
		<input type="hidden" name="contentType" value="#cb.isEntryView() ? cb.getCurrentEntry().getContentType() : cb.getCurrentPage().getContentType()#" />
		<div id="author_info">
			<div class="row">
				<input type="text" id="author" name="author" tabindex="1" value="#event.getValue("author","")#" size="30" />
				<label for="author" class="small">Name (required)</label>
			</div>
			<div class="row">
				<input type="text" id="email" name="authorEmail" tabindex="2" value="#event.getValue("authorEmail","")#" size="30" />
				<label for="email" class="small">Email (required)</label>
				<em>(will not be published)</em>
			</div>
			<div class="row">
				<input type="text" id="url" name="authorURL" tabindex="3" value="#event.getValue("authorURL","")#" size="30"  />
				<label for="url" class="small">Website</label>
			</div>
		</div>
		<div class="row">
			<textarea id="comment" name="content" tabindex="4" rows="8" cols="65%" >#event.getValue("content","")#</textarea>
		</div>
		<div class="row">
			<input type="checkbox" id="subscribe" name="subscribe" value="1" />
			<label for="subscribe">Notify me of follow-up comments by email.</label>
		</div>
		<cfif cb.setting( "cb_comments_captcha", false ) >
			<div class="row">
				<img src="#event.buildLink( event.getValue( "cbEntryPoint", "", true) & "__captcha" )#" /><br />
				<input type="text" id="captchacode" name="captchacode" tabindex="5" size="30" />
				<label for="author" class="small">Enter the security code shown above</label>
			</div>
		</cfif>
		<div class="row">
			#cb.event("cbui_postCommentForm")#
		</div>
		<div id="submitbox" class="left">
			<span class="button submit">
				<a title="Submit" href="javascript:document.commentform.submit();"><span><span>Submit</span></span></a>
			</span>
		</div>
		<div class="clear"></div>
	</form>
</div>
</cfoutput>