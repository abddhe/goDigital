import 'dart:math';

final Map<String, dynamic> postData = {
  "data": [
    {
      "image":
          'https://images.unsplash.com/photo-1468581264429-2548ef9eb732?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
      "user": {
        "display_name": "Leanne Graham",
        "avatar": "https://via.placeholder.com/150/66b7d2",
      },
      "isLiked": Random.secure().nextBool(),
      "comments": [
        {
          "body": "Nice post 🌹",
          "user": {
            "display_name": "Leanne Graham",
            "avatar": "https://via.placeholder.com/150/66b7d2",
          },
        },
        {
          "body": "Good joke 😂",
          "user": {
            "display_name": "Clementine Bauch",
            "avatar": "https://via.placeholder.com/150/24f355",
          },
        },
      ],
    },
    {
      "image":
          'https://images.unsplash.com/photo-1439405326854-014607f694d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
      "body":
          "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla",
      "user": {
        "display_name": "Clementine Bauch",
        "avatar": "https://via.placeholder.com/150/24f355",
      },
      "isLiked": Random.secure().nextBool(),
      "comments": [
        {
          "body": "Good morning",
          "user": {
            "display_name": "Clementine Bauch",
            "avatar": "https://via.placeholder.com/150/24f355",
          },
        },
      ],
    },
    {
      "image":
          'https://plus.unsplash.com/premium_photo-1667425711527-1c4e52dbf62d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1635&q=80',
      "body":
          "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut",
      "user": {
        "display_name": "Patricia Lebsack",
        "avatar": "https://via.placeholder.com/150/d32776",
      },
      "isLiked": Random.secure().nextBool(),
      "comments": [
        {
          "body": "You are on right way keep going 👌",
          "user": {
            "display_name": "Clementine Bauch",
            "avatar": "https://via.placeholder.com/150/24f355",
          },
        },
        {
          "body": "Harry up!",
          "user": {
            "display_name": "Mrs. Dennis Schulist",
            "avatar": "https://via.placeholder.com/150/51aa97",
          },
        },
        {
          "body": "Thx guys for all comment's",
          "user": {
            "display_name": "Patricia Lebsack",
            "avatar": "https://via.placeholder.com/150/d32776",
          },
        },
      ],
    },
    {
      "image":
          'https://images.unsplash.com/photo-1559128010-7c1ad6e1b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1746&q=80',
      "body":
          "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit",
      "user": {
        "display_name": "Chelsey Dietrich",
        "avatar": "https://via.placeholder.com/150/f66b97",
      },
      "isLiked": Random.secure().nextBool(),
      "comments": [],
    },
    {
      "image":
          'https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1634&q=80',
      "body":
          "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque",
      "user": {
        "display_name": "Mrs. Dennis Schulist",
        "avatar": "https://via.placeholder.com/150/51aa97",
      },
      "isLiked": Random.secure().nextBool(),
      "comments": [
        {
          "body": "That's Right 👍",
          "user": {
            "display_name": "Chelsey Dietrich",
            "avatar": "https://via.placeholder.com/150/f66b97",
          },
        },
      ],
    },
  ]
};
