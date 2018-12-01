exports.getComments = (req, res) => {
    let store = req.store;
    let postId = req.params.postId;

    res.status(200);
    res.send(store.posts[postId].comments)
}

exports.addComment = (req, res) => {
    let store = req.store;
    let postId = req.params.postId;
    res.status(201);

    if (!store.posts[postId].comments)  {
        store.posts[postId].comments = [];
    }
    store.posts[postId].comments.push(req.body);
    console.log(typeof(store.posts[postId].comments));
    res.send(store.posts[postId].comments)
}

exports.updateComment = (req, res) => {
    let store = req.store;
    let postId = req.params.postId;
    let commentId = req.params.commentId;

    if(!req.store.posts[postId].comments[commentId]) {
        return res.status(400).send();
    }

    store.posts[postId].comments[commentId] = req.body;
   
    res.status(200);
    res.send(store.posts[postId].comments[commentId]);
}

exports.removeComment = (req, res) => {
    let store = req.store;
    let postId = req.params.postId;
    let commentId = req.params.commentId;

    store.posts[postId].comments.splice(commentId, 1);
    res.status(204);
    res.send();
}