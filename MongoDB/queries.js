// queries.js

// 1. List all articles published in the last 30 days
db.articles.find(
  { publish_date: { $gte: new Date(new Date() - 30*24*60*60*1000) } }
).sort({ publish_date: -1 });

// 2. Find an article by its title
db.articles.find({ title: "Introduction to MongoDB" });

// 3. List articles with author's username
db.articles.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "author_id",
      foreignField: "_id",
      as: "author_info"
    }
  },
  {
    $project: { title: 1, author: { $arrayElemAt: ["$author_info.username", 0] } }
  }
]);

// 4. List articles with 'mongodb' tag
db.articles.find({ tags: "mongodb" });

// 5. Articles by a specific author
const authorId = db.users.findOne({ username: "author_alice" })._id;
db.articles.find({ author_id: authorId });

// 6️ Users who never wrote an article
db.users.aggregate([
  {
    $lookup: {
      from: "articles",
      localField: "_id",
      foreignField: "author_id",
      as: "articles"
    }
  },
  { $match: { articles: { $size: 0 } } },
  { $project: { username: 1, email: 1 } }
]);

// 7️ Categories without articles
db.categories.aggregate([
  {
    $lookup: {
      from: "articles",
      localField: "_id",
      foreignField: "category_id",
      as: "articles"
    }
  },
  { $match: { articles: { $size: 0 } } }
]);

// 8️ Count of articles per category
db.articles.aggregate([
  { $group: { _id: "$category_id", total_articles: { $sum: 1 } } }
]);

// 9️ For each article, show title and number of comments
db.articles.aggregate([
  { $project: { title: 1, num_comments: { $size: "$comments" } } }
]);

// 10 Authors who wrote more than 3 articles
db.articles.aggregate([
  { $group: { _id: "$author_id", total: { $sum: 1 } } },
  { $match: { total: { $gt: 3 } } }
]);

// 11 Total likes per author
db.articles.aggregate([
  { $group: { _id: "$author_id", total_likes: { $sum: "$likes" } } }
]);

// 12 Top 5 most popular (most comments)
db.articles.aggregate([
  { $project: { title: 1, comment_count: { $size: "$comments" } } },
  { $sort: { comment_count: -1 } },
  { $limit: 5 }
]);