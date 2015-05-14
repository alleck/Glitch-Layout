component extends="contentbox.model.ui.BaseWidget" singleton{

	RecentComments function init( controller ) {

		super.init(controller);

		setPluginName("Recent Comments");
		setPluginVersion("1.0");
		setPluginDescription("A basic widget that shows the latest x number of comments.");
		setPluginAuthor("Don Bellamy");
		setPluginAuthorURL("http://donbellamy.com");
		setIcon( "comment-add.png" );
		setCategory( "Content" );

		return this;
	}

	any function renderIt(numeric max=5,numeric maxChars=80,string title="",string titleLevel="2") {
		var event 			= getRequestContext();
		var cbSettings 		= event.getValue(name="cbSettings",private=true);
		var commentResults 	= commentService.findApprovedComments(max=arguments.max);
		var rString			= "";
		var li 				= "";
		var authorUrl		= "";

		// iteration cap
		if( commentResults.count lt arguments.max){
			arguments.max = commentResults.count;
		}

		// generate recent comments
		saveContent variable="rString"{
			// title
			if( len(arguments.title) ){ writeOutput("<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>"); }
			// UL start
			writeOutput('<ul id="recentcomments">');
			// iterate and create
			for(var x=1; x lte arguments.max; x++){
				authorUrl = !findNoCase( "http", commentResults.comments[x].getAuthorUrl() ) ? "http://" & commentResults.comments[x].getAuthorUrl() : commentResults.comments[x].getAuthorUrl();
				li = "<li class=""recentcomments"">";
				if ( len( authorUrl ) ) li &= "<a href=""" & authorUrl & """ rel=""external nofollow"" class=""url"">";
				li &= commentResults.comments[x].getAuthor();
				if ( len( authorUrl ) ) li &= "</a>";
				li &= ": <a href=""" & cb.linkComment(commentResults.comments[x]) & """>" & left(commentResults.comments[x].getContent(),arguments.maxChars) & "</a></li>";
				writeOutput( li );
			}
			// close ul
			writeOutput("</ul>");
		}

		return rString;
	}

}
