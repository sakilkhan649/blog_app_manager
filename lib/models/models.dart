// =================== User Model ===================

class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final String? bio;
  final String? registeredDate;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    this.bio,
    this.registeredDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      avatar: json['avatar'],
      bio: json['bio'],
      registeredDate: json['registered_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'bio': bio,
      'registered_date': registeredDate,
    };
  }
}

// =================== Author Model ===================

class AuthorModel {
  final int id;
  final String name;
  final String? avatar;
  final String? bio;

  AuthorModel({
    required this.id,
    required this.name,
    this.avatar,
    this.bio,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'],
      bio: json['bio'],
    );
  }
}

// =================== Category Model ===================

class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String? description;
  final int count;
  final String? image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    required this.count,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'],
      count: json['count'] ?? 0,
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'count': count,
      'image': image,
    };
  }
}

// =================== Post Model ===================

class PostModel {
  final int id;
  final String title;
  final String? content;
  final String excerpt;
  final String? featuredImage;
  final AuthorModel author;
  final List<String> categories;
  final List<String>? tags;
  final int readTime;
  final String createdAt;
  final int likeCount;
  final int commentCount;
  final bool isLiked;
  final bool isBookmarked;

  PostModel({
    required this.id,
    required this.title,
    this.content,
    required this.excerpt,
    this.featuredImage,
    required this.author,
    required this.categories,
    this.tags,
    required this.readTime,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
    required this.isBookmarked,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'],
      excerpt: json['excerpt'] ?? '',
      featuredImage: json['featured_image'],
      author: AuthorModel.fromJson(json['author'] ?? {}),
      categories: List<String>.from(json['categories'] ?? []),
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      readTime: json['read_time'] ?? 0,
      createdAt: json['created_at'] ?? '',
      likeCount: json['like_count'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      isLiked: json['is_liked'] ?? false,
      isBookmarked: json['is_bookmarked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'excerpt': excerpt,
      'featured_image': featuredImage,
      'author': author,
      'categories': categories,
      'tags': tags,
      'read_time': readTime,
      'created_at': createdAt,
      'like_count': likeCount,
      'comment_count': commentCount,
      'is_liked': isLiked,
      'is_bookmarked': isBookmarked,
    };
  }

  // Copy with method for updating specific fields
  PostModel copyWith({
    bool? isLiked,
    int? likeCount,
    bool? isBookmarked,
    int? commentCount,
  }) {
    return PostModel(
      id: id,
      title: title,
      content: content,
      excerpt: excerpt,
      featuredImage: featuredImage,
      author: author,
      categories: categories,
      tags: tags,
      readTime: readTime,
      createdAt: createdAt,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}

// =================== Comment Model ===================

class CommentModel {
  final int id;
  final int postId;
  final int userId;
  final int parentId;
  final String content;
  final int likesCount;
  final String createdAt;
  final String updatedAt;
  final AuthorModel author;
  final List<CommentModel> replies;
  final bool isLiked;

  CommentModel({
    required this.id,
    required this.postId,
    required this.userId,
    required this.parentId,
    required this.content,
    required this.likesCount,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
    required this.replies,
    required this.isLiked,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ?? 0,
      postId: json['post_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      parentId: json['parent_id'] ?? 0,
      content: json['content'] ?? '',
      likesCount: json['likes_count'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      author: AuthorModel.fromJson(json['author'] ?? {}),
      replies: json['replies'] != null
          ? (json['replies'] as List)
          .map((reply) => CommentModel.fromJson(reply))
          .toList()
          : [],
      isLiked: json['is_liked'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'post_id': postId,
      'user_id': userId,
      'parent_id': parentId,
      'content': content,
      'likes_count': likesCount,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'author': author,
      'replies': replies.map((reply) => reply.toJson()).toList(),
      'is_liked': isLiked,
    };
  }
}

// =================== Auth Response Model ===================

class AuthResponseModel {
  final UserModel user;
  final String token;
  final String tokenType;
  final int expiresIn;

  AuthResponseModel({
    required this.user,
    required this.token,
    required this.tokenType,
    required this.expiresIn,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: UserModel.fromJson(json['user'] ?? {}),
      token: json['token'] ?? '',
      tokenType: json['token_type'] ?? 'Bearer',
      expiresIn: json['expires_in'] ?? 86400,
    );
  }
}

// =================== Pagination Model ===================

class PaginationModel {
  final int currentPage;
  final int perPage;
  final int totalItems;
  final int totalPages;

  PaginationModel({
    required this.currentPage,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['current_page'] ?? 1,
      perPage: json['per_page'] ?? 10,
      totalItems: json['total_posts'] ?? json['total_comments'] ?? 0,
      totalPages: json['total_pages'] ?? 1,
    );
  }

  bool get hasMore => currentPage < totalPages;
}

// =================== API Response Model ===================

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final List<dynamic>? errors;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.errors,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic)? fromJsonT,
      ) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : json['data'],
      errors: json['errors'],
    );
  }
}