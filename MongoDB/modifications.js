// modifications.js

// 1. Add a new comment
const articleId = db.articles.findOne({ title: "Introduction to MongoDB" })._id;
db.articles.updateOne(
  { _id: articleId },
  { $push: { comments: {
      user_id: db.users.findOne({ username: "reader_eve" })._id,
      username: "reader_eve",
      text: "Thanks for this info!",
      comment_date: new Date()
    }
  }}
);

// 2. Increment likes
db.articles.updateOne(
  { _id: articleId },
  { $inc: { likes: 1 } }
);

// 3. Remove inappropriate tag
db.articles.updateOne(
  { _id: articleId },
  { $pull: { tags: "nosql" } }
);
