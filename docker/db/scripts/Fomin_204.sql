CREATE TABLE "Publisher" (
  "Publisher_name" int PRIMARY KEY,
  "address" char(128)
);

CREATE TABLE "Book" (
  "ISBN" int PRIMARY KEY,
  "Publisher_name" int,
  "Year" char(128),
  "Author" char(128),
  "Number_of_pages" char(128),
  "Name" char(128)
);

CREATE TABLE "Of_category" (
  "ISBN" int,
  "Category_name" char(128),
  PRIMARY KEY ("ISBN", "Category_name")
);

CREATE TABLE "Category" (
  "Category_name" char(128) PRIMARY KEY
);

CREATE TABLE "Is_a_subcategory_of" (
  "Subcategory_name" char(128) PRIMARY KEY,
  "Category_name" char(128)
);

CREATE TABLE "Book_instance" (
  "Book_instance_id" int,
  "Book_ISBN" int,
  "Shelf_number" int,
  PRIMARY KEY ("Book_instance_id", "Book_ISBN")
);

CREATE TABLE "Book_borrow" (
  "Book_instance_id" int,
  "Reader_number" int,
  "Borrow_date" char(128),
  "Return_date" char(128),
  PRIMARY KEY ("Book_instance_id", "Reader_number")
);

CREATE TABLE "Reader" (
  "Reader_number" int PRIMARY KEY,
  "Name" char(128),
  "Address" char(128),
  "Date_of_birth" char(128)
);

ALTER TABLE "Book" ADD FOREIGN KEY ("Publisher_name") REFERENCES "Publisher" ("Publisher_name");

ALTER TABLE "Category" ADD FOREIGN KEY ("Category_name") REFERENCES "Is_a_subcategory_of" ("Subcategory_name");

ALTER TABLE "Is_a_subcategory_of" ADD FOREIGN KEY ("Category_name") REFERENCES "Category" ("Category_name");

ALTER TABLE "Of_category" ADD FOREIGN KEY ("Category_name") REFERENCES "Category" ("Category_name");

ALTER TABLE "Of_category" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Book_instance" ADD FOREIGN KEY ("Book_ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Book_borrow" ADD FOREIGN KEY ("Book_instance_id") REFERENCES "Book_instance" ("Book_instance_id");

ALTER TABLE "Reader" ADD FOREIGN KEY ("Reader_number") REFERENCES "Book_borrow" ("Reader_number");