	<body>
    <div class="top-bar">
        <h1>
            My Forum
        </h1>
        <form action="thread.jsp" align = right>
    <input type="text" name = "subject" id = "subject" placeholder="Search"> 
  </form> 
    </div>
    <div class="main">
        <ol>
        </ol>
    </div>
    <script src="data.js"></script>
    <script>
        console.log(threads);
        var container = document.querySelector('ol');
        for (let thread of threads) {
            var html = `
            <li class="row">
                <a href="/EP_Project/thread.html?${thread.id}">
                    <h4 class="title">
                        ${thread.title}
                    </h4>
                    <div class="bottom">
                        <p class="timestamp">
                            ${new Date(thread.date).toLocaleString()}
                        </p>
                        <p class="comment-count">
                            ${thread.comments.length} comments
                        </p>
                            %>
                    </div>
                </a>
            </li>
            `
            container.insertAdjacentHTML('beforeend', html);
        }
    </script>
    <style>
        *{
    box-sizing: border-box;
}

html{
    font-size: 14px;
    font-family: 'Titillium Web', sans-serif;
    background-color:rgb(181, 220, 252);
    color:#FEFEFE;
}

a{
    color:#FF0042;
    font-weight: bolder;
    text-decoration: none;
}

h1{
	background-color:#4a81d3;
    font-size:16px;
    font-weight: bolder;
    border-radius: 5px;
    padding:20px;
    font-weight: bolder;
}
.row{
    background-color:#4a81d3;
    padding: 15px;
    border-radius: 5px;
    margin:4px;
    width:75%
    
}
.loger
{
	background-color:#4a81d3;
    padding: 15px;
    border-radius: 5px;
    margin:4px;
    width:15%
}
    </style>
    <a class="loger" href="logout">LogOut</a>
</body>