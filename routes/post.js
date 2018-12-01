/*
 *  Written by dare-darryl
 *  
 * 
 * 
 * 
 */

exports.getPosts = (req, res) => {
    res.status(200);
    res.send(req.store.posts);
}

exports.addPost = (req, res) => {
    let store = req.store;
    let id = req.store.posts.length;
    store.posts.push(req.body);

    res.status(201);

    let msg = {id: id};
    res.send(msg);
}

exports.updatePost = (req, res) => {
    let store = req.store;
    let id = req.params.id;

    if(!req.store.posts[id]) {
        return res.status(400).send();
    }
    
    store.posts[id] = req.body;

    res.status(200);
    res.send(store.posts[id]);
}

exports.removePost = (req, res) => {
    let store = req.store;
    let id = req.params.id;

    store.posts.splice(id, 1);
    res.status(204);
    res.send();
}