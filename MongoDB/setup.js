// setup.js

// Use the database 'inkwell'
//use inkwell;

// Drop existing collections if they exist
db.users.drop();
db.categories.drop();

// ----------------------
// Create Users
// ----------------------
db.users.insertMany([
  { username: "author_alice", email: "alice@example.com", join_date: new Date("2025-01-01") },
  { username: "author_bob", email: "bob@example.com", join_date: new Date("2025-02-01") },
  { username: "author_charlie", email: "charlie@example.com", join_date: new Date("2025-03-01") },
  { username: "reader_dave", email: "dave@example.com", join_date: new Date("2025-04-01") },
  { username: "reader_eve", email: "eve@example.com", join_date: new Date("2025-05-01") },
  { username: "author_faythe", email: "faythe@example.com", join_date: new Date("2025-06-01") },
  { username: "reader_grace", email: "grace@example.com", join_date: new Date("2025-07-01") },
  { username: "author_heidi", email: "heidi@example.com", join_date: new Date("2025-08-01") },
  { username: "reader_ivan", email: "ivan@example.com", join_date: new Date("2025-09-01") },
  { username: "author_judy", email: "judy@example.com", join_date: new Date("2025-10-01") },
  { username: "reader_mallory", email: "mallory@example.com", join_date: new Date("2025-10-05") },
  { username: "reader_niaj", email: "niaj@example.com", join_date: new Date("2025-10-07") },
  { username: "author_oscar", email: "oscar@example.com", join_date: new Date("2025-10-09") },
  { username: "reader_peggy", email: "peggy@example.com", join_date: new Date("2025-10-10") },
  { username: "reader_trudy", email: "trudy@example.com", join_date: new Date("2025-10-12") }
]);

// ----------------------
// Create Categories
// ----------------------
db.categories.insertMany([
  { category_name: "Technology", description: "Articles on new technologies and development." },
  { category_name: "Health", description: "Articles on health, fitness, and well-being." },
  { category_name: "Education", description: "Articles about learning and academic growth." },
  { category_name: "Travel", description: "Articles about travel and experiences." },
  { category_name: "Food", description: "Articles about recipes, cooking, and nutrition." }
]);

print("Users and Categories created successfully!");
