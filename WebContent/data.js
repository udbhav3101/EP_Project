var defaultThreads = [
    {
        id: 1,
        title: "Computer Networks and Security",
        author: "Surya",
        date: Date.now(),
        content: "Thread content",
        comments: [
            {
                author: "Udbhav",
                date: Date.now(),
                content: "Hey there"
            },
            {
                author: "Surya",
                date: Date.now(),
                content: "Hey to you too"
            }
        ]
    },
    {
        id: 2,
        title: "Mathematical Programming-2",
        author: "Surya",
        date: Date.now(),
        content: "Thread content 2",
        comments: [
            {
                author: "Udbhav",
                date: Date.now(),
                content: "Hey there"
            },
            {
                author: "Surya",
                date: Date.now(),
                content: "Hey to you too"
            }
        ]
    },
      {
        id: 3,
        title: "Enterprise Programming",
        author: "Vinay",
        date: Date.now(),
        content: "Thread content",
        comments: [
            {
                author: "Udbhav",
                date: Date.now(),
                content: "Hey there"
            },
            {
                author: "Surya",
                date: Date.now(),
                content: "Hey to you too"
            }
        ]
    },
    {
        id: 4,
        title: "Data Science",
        author: "Pavan Karthik",
        date: Date.now(),
        content: "Thread content",
        comments: [
            {
                author: "Surya",
                date: Date.now(),
                content: "Hey there"
            },
            {
                author: "Udbhav",
                date: Date.now(),
                content: "Hey to you too"
            }
        ]
    },
    {
        id: 5,
        title: "Python Full Stack",
        author: "Vinay",
        date: Date.now(),
        content: "Thread content",
        comments: [
            {
                author: "Udbhav",
                date: Date.now(),
                content: "Hey there"
            },
            {
                author: "Surya",
                date: Date.now(),
                content: "Hey to you too"
            }
        ]
    },
    {
        id: 6,
        title: "Competitive coding",
        author: "Vinay",
        date: Date.now(),
        content: "Thread content",
        comments: [
            {
                author: "Udbhav",
                date: Date.now(),
                content: "Hey there"
            },
            {
                author: "Surya",
                date: Date.now(),
                content: "Hey to you too"
            }
        ]
    },
    {
        id: 7,
        title: "Aptitude Builder",
        author: "Vinay",
        date: Date.now(),
        content: "Thread content",
        comments: [
            {
                author: "Udbhav",
                date: Date.now(),
                content: "Hey there"
            },
            {
                author: "Surya",
                date: Date.now(),
                content: "Hey to you too"
            }
        ]
    }
]

var threads = defaultThreads
if (localStorage && localStorage.getItem('threads')) {
    threads = JSON.parse(localStorage.getItem('threads'));
} else {
    threads = defaultThreads;
    localStorage.setItem('threads', JSON.stringify(defaultThreads));
}