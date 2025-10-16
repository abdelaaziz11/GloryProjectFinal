// data.js


// Drop existing collection
db.articles.drop();

// Insert articles
db.articles.insertMany([
  {
    title: "Introduction to MongoDB",
    content: "MongoDB is a NoSQL database...",
    author_id: db.users.findOne({ username: "author_alice" })._id,
    category_id: db.categories.findOne({ category_name: "Technology" })._id,
    publish_date: new Date("2025-10-01"),
    tags: ["database", "nosql", "mongodb"],
    likes: 120,
    comments: [
      {
        user_id: db.users.findOne({ username: "reader_dave" })._id,
        username: "reader_dave",
        text: "Great article!",
        comment_date: new Date("2025-10-02")
      }
    ]
  },
  {
    title: "Healthy Eating Habits",
    content: "Eating healthy is important...",
    author_id: db.users.findOne({ username: "author_bob" })._id,
    category_id: db.categories.findOne({ category_name: "Health" })._id,
    publish_date: new Date("2025-10-03"),
    tags: ["health", "nutrition", "wellbeing"],
    likes: 80,
    comments: []
  },
  // Add 28 more articles similarly with variety of authors, categories, tags, likes, and comments
]);



// Get authors and categories
const authors = db.users.find({ username: /author_/ }).toArray();
const readers = db.users.find({ username: /reader_/ }).toArray();
const categories = db.categories.find().toArray();

const tagsList = [
  ["mongodb", "database", "nosql"],
  ["health", "nutrition", "lifestyle"],
  ["education", "learning", "growth"],
  ["travel", "adventure", "culture"],
  ["food", "recipe", "cooking"]
];

const articles = [];

// Create 30 random articles
for (let i = 1; i <= 30; i++) {
  const author = authors[Math.floor(Math.random() * authors.length)];
  const category = categories[Math.floor(Math.random() * categories.length)];
  const tags = tagsList[Math.floor(Math.random() * tagsList.length)];

  // Generate 0 to 3 random comments
  const commentCount = Math.floor(Math.random() * 4);
  const comments = [];

  for (let j = 0; j < commentCount; j++) {
    const reader = readers[Math.floor(Math.random() * readers.length)];
    comments.push({
      user_id: reader._id,
      username: reader.username,
      text: `Nice post ${i}!`,
      comment_date: new Date(2025, 9, 1 + Math.floor(Math.random() * 14))
    });
  }

  articles.push({
    title: `Article ${i} - ${category.category_name}`,
    content: `This is article ${i} about ${category.category_name}.`,
    author_id: author._id,
    category_id: category._id,
    publish_date: new Date(2025, 9, 1 + Math.floor(Math.random() * 14)),
    tags: tags,
    likes: Math.floor(Math.random() * 300),
    comments: comments
  });
}

db.articles.insertMany(articles);
