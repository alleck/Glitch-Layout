<cfparam name="args.sidebar" default="true" />
<cfoutput>
#cb.quickView("_html_head")#
<body>
	#cb.event("cbui_afterBodyStart")#
	<div id="page-wrap1">
		<div id="page-wrap2">
			<div id="page"<cfif args.sidebar > class="with-sidebar"</cfif>>
				<div id="main-wrap">
					<div id="mid-wrap">
						<div id="side-wrap">
							<div id="mid">
								#cb.quickView("_header")#
								<div id="mid-content" >
									#cb.event("cbui_beforeContent")#
									#cb.mainView()#
									#cb.event("cbui_afterContent")#
								</div>
							</div>
															<cfif args.sidebar >
									#cb.quickView("_sidebar")#
								</cfif>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	#cb.quickView("_footer")#
	#cb.event("cbui_beforeBodyEnd")#
</body>
#cb.quickView("_html_footer")#
</cfoutput>