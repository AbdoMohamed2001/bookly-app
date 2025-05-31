import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

/// kind : "books#volume"
/// id : "ZPneDQAAQBAJ"
/// etag : "Vwe+aq3VDdM"
/// selfLink : "https://www.googleapis.com/books/v1/volumes/ZPneDQAAQBAJ"
/// volumeInfo : {"title":"Invent Your Own Computer Games with Python, 4th Edition","authors":["Al Sweigart"],"publisher":"No Starch Press","publishedDate":"2016-12-16","description":"Invent Your Own Computer Games with Python will teach you how to make computer games using the popular Python programming language—even if you’ve never programmed before! Begin by building classic games like Hangman, Guess the Number, and Tic-Tac-Toe, and then work your way up to more advanced games, like a text-based treasure hunting game and an animated collision-dodging game with sound effects. Along the way, you’ll learn key programming and math concepts that will help you take your game programming to the next level. Learn how to: –Combine loops, variables, and flow control statements into real working programs –Choose the right data structures for the job, such as lists, dictionaries, and tuples –Add graphics and animation to your games with the pygame module –Handle keyboard and mouse input –Program simple artificial intelligence so you can play against the computer –Use cryptography to convert text messages into secret code –Debug your programs and find common errors As you work through each game, you’ll build a solid foundation in Python and an understanding of computer science fundamentals. What new game will you create with the power of Python? The projects in this book are compatible with Python 3.","industryIdentifiers":[{"type":"ISBN_13","identifier":"9781593277956"},{"type":"ISBN_10","identifier":"1593277954"}],"readingModes":{"text":true,"image":true},"pageCount":377,"printType":"BOOK","categories":["Computers"],"averageRating":3,"ratingsCount":2,"maturityRating":"NOT_MATURE","allowAnonLogging":true,"contentVersion":"2.3.3.0.preview.3","panelizationSummary":{"containsEpubBubbles":false,"containsImageBubbles":false},"imageLinks":{"smallThumbnail":"http://books.google.com/books/content?id=ZPneDQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api","thumbnail":"http://books.google.com/books/content?id=ZPneDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"},"language":"en","previewLink":"http://books.google.com/books?id=ZPneDQAAQBAJ&printsec=frontcover&dq=programming&hl=&cd=1&source=gbs_api","infoLink":"http://books.google.com/books?id=ZPneDQAAQBAJ&dq=programming&hl=&source=gbs_api","canonicalVolumeLink":"https://books.google.com/books/about/Invent_Your_Own_Computer_Games_with_Pyth.html?hl=&id=ZPneDQAAQBAJ"}
/// saleInfo : {"country":"US","saleability":"NOT_FOR_SALE","isEbook":false}
/// accessInfo : {"country":"US","viewability":"PARTIAL","embeddable":true,"publicDomain":false,"textToSpeechPermission":"ALLOWED","epub":{"isAvailable":true},"pdf":{"isAvailable":true},"webReaderLink":"http://play.google.com/books/reader?id=ZPneDQAAQBAJ&hl=&source=gbs_api","accessViewStatus":"SAMPLE","quoteSharingAllowed":false}
/// searchInfo : {"textSnippet":"What new game will you create with the power of Python? The projects in this book are compatible with Python 3."}

class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
          bookId: id,
          imageUrl: volumeInfo?.imageLinks?.thumbnail ?? '',
          name: volumeInfo!.title,
          authorName: volumeInfo.authors!.first,
          price: 0.0,
          rating: volumeInfo.averageRating,
        );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] ?? '',
        id: json['id'] ?? '',
        etag: json['etag'] ?? '',
        selfLink: json['selfLink'] ?? '',
        volumeInfo: json['volumeInfo'] != null
            ? VolumeInfo.fromJson(json['volumeInfo'])
            : null,
        saleInfo: json['saleInfo'] != null
            ? SaleInfo.fromJson(json['saleInfo'])
            : null,
        accessInfo: json['accessInfo'] != null
            ? AccessInfo.fromJson(json['accessInfo'])
            : null,
        searchInfo: json['searchInfo'] != null
            ? SearchInfo.fromJson(json['searchInfo'])
            : null,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }
}

class SearchInfo {
  SearchInfo({
    this.textSnippet,
  });

  SearchInfo.fromJson(dynamic json) {
    textSnippet = json['textSnippet'];
  }

  String? textSnippet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textSnippet'] = textSnippet;
    return map;
  }
}

/// country : "US"
/// viewability : "PARTIAL"
/// embeddable : true
/// publicDomain : false
/// textToSpeechPermission : "ALLOWED"
/// epub : {"isAvailable":true}
/// pdf : {"isAvailable":true}
/// webReaderLink : "http://play.google.com/books/reader?id=ZPneDQAAQBAJ&hl=&source=gbs_api"
/// accessViewStatus : "SAMPLE"
/// quoteSharingAllowed : false

class AccessInfo {
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  AccessInfo.fromJson(dynamic json) {
    country = json['country'];
    viewability = json['viewability'];
    embeddable = json['embeddable'];
    publicDomain = json['publicDomain'];
    textToSpeechPermission = json['textToSpeechPermission'];
    epub = json['epub'] != null ? Epub.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null;
    webReaderLink = json['webReaderLink'];
    accessViewStatus = json['accessViewStatus'];
    quoteSharingAllowed = json['quoteSharingAllowed'];
  }

  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['viewability'] = viewability;
    map['embeddable'] = embeddable;
    map['publicDomain'] = publicDomain;
    map['textToSpeechPermission'] = textToSpeechPermission;
    if (epub != null) {
      map['epub'] = epub?.toJson();
    }
    if (pdf != null) {
      map['pdf'] = pdf?.toJson();
    }
    map['webReaderLink'] = webReaderLink;
    map['accessViewStatus'] = accessViewStatus;
    map['quoteSharingAllowed'] = quoteSharingAllowed;
    return map;
  }
}

/// isAvailable : true

class Pdf {
  Pdf({
    this.isAvailable,
  });

  Pdf.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }

  bool? isAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    return map;
  }
}

/// isAvailable : true

class Epub {
  Epub({
    this.isAvailable,
  });

  Epub.fromJson(dynamic json) {
    isAvailable = json['isAvailable'];
  }

  bool? isAvailable;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAvailable'] = isAvailable;
    return map;
  }
}

/// country : "US"
/// saleability : "NOT_FOR_SALE"
/// isEbook : false

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  SaleInfo.fromJson(dynamic json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
  }

  String? country;
  String? saleability;
  bool? isEbook;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['saleability'] = saleability;
    map['isEbook'] = isEbook;
    return map;
  }
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  VolumeInfo.fromJson(dynamic json) {
    title = json['title']?.toString() ?? '';
    authors = (json['authors'] is List)
        ? List<String>.from(json['authors'].whereType<String>())
        : [];

    publisher = json['publisher']?.toString() ?? '';
    publishedDate = json['publishedDate']?.toString() ?? '';
    description = json['description']?.toString() ?? '';

    if (json['industryIdentifiers'] is List) {
      industryIdentifiers = (json['industryIdentifiers'] as List)
          .map((v) => IndustryIdentifiers.fromJson(v))
          .toList();
    } else {
      industryIdentifiers = [];
    }

    readingModes = json['readingModes'] != null
        ? ReadingModes.fromJson(json['readingModes'])
        : ReadingModes(); // <-- Default constructor

    pageCount = json['pageCount'] is num ? json['pageCount'] : 0;
    printType = json['printType']?.toString() ?? '';

    categories = (json['categories'] is List)
        ? List<String>.from(json['categories'].whereType<String>())
        : [];

    averageRating = json['averageRating'] is num ? json['averageRating'] : 0;
    ratingsCount = json['ratingsCount'] is num ? json['ratingsCount'] : 0;
    maturityRating = json['maturityRating']?.toString() ?? '';
    allowAnonLogging =
        json['allowAnonLogging'] is bool ? json['allowAnonLogging'] : false;
    contentVersion = json['contentVersion']?.toString() ?? '';

    panelizationSummary = json['panelizationSummary'] != null
        ? PanelizationSummary.fromJson(json['panelizationSummary'])
        : PanelizationSummary(); // <-- Default constructor

    imageLinks = json['imageLinks'] != null
        ? ImageLinks.fromJson(json['imageLinks'])
        : ImageLinks(); // <-- Default constructor

    language = json['language']?.toString() ?? '';
    previewLink = json['previewLink']?.toString() ?? '';
    infoLink = json['infoLink']?.toString() ?? '';
    canonicalVolumeLink = json['canonicalVolumeLink']?.toString() ?? '';
  }

  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  num? pageCount;
  String? printType;
  List<String>? categories;
  num? averageRating;
  num? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['authors'] = authors;
    map['publisher'] = publisher;
    map['publishedDate'] = publishedDate;
    map['description'] = description;
    if (industryIdentifiers != null) {
      map['industryIdentifiers'] =
          industryIdentifiers?.map((v) => v.toJson()).toList();
    }
    if (readingModes != null) {
      map['readingModes'] = readingModes?.toJson();
    }
    map['pageCount'] = pageCount;
    map['printType'] = printType;
    map['categories'] = categories;
    map['averageRating'] = averageRating;
    map['ratingsCount'] = ratingsCount;
    map['maturityRating'] = maturityRating;
    map['allowAnonLogging'] = allowAnonLogging;
    map['contentVersion'] = contentVersion;
    if (panelizationSummary != null) {
      map['panelizationSummary'] = panelizationSummary?.toJson();
    }
    if (imageLinks != null) {
      map['imageLinks'] = imageLinks?.toJson();
    }
    map['language'] = language;
    map['previewLink'] = previewLink;
    map['infoLink'] = infoLink;
    map['canonicalVolumeLink'] = canonicalVolumeLink;
    return map;
  }
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  ImageLinks.fromJson(dynamic json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }

  String? smallThumbnail;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['smallThumbnail'] = smallThumbnail;
    map['thumbnail'] = thumbnail;
    return map;
  }
}

class PanelizationSummary {
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  PanelizationSummary.fromJson(dynamic json) {
    containsEpubBubbles = json['containsEpubBubbles'];
    containsImageBubbles = json['containsImageBubbles'];
  }

  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['containsEpubBubbles'] = containsEpubBubbles;
    map['containsImageBubbles'] = containsImageBubbles;
    return map;
  }
}

/// text : true
/// image : true

class ReadingModes {
  ReadingModes({
    this.text,
    this.image,
  });

  ReadingModes.fromJson(dynamic json) {
    text = json['text'];
    image = json['image'];
  }

  bool? text;
  bool? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['image'] = image;
    return map;
  }
}

/// type : "ISBN_13"
/// identifier : "9781593277956"

class IndustryIdentifiers {
  IndustryIdentifiers({
    this.type,
    this.identifier,
  });

  IndustryIdentifiers.fromJson(dynamic json) {
    type = json['type'];
    identifier = json['identifier'];
  }

  String? type;
  String? identifier;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['identifier'] = identifier;
    return map;
  }
}
