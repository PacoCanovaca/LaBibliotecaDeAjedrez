// Para búsqueda de un libro por su título
CREATE INDEX idx_books_title ON books(title);

// Para búsqueda de un libro por su autor
CREATE INDEX idx_authors_name ON authors(name);
CREATE INDEX idx_books_authors_author_id ON books_authors(author_id);
CREATE INDEX idx_books_authors_book_id ON books_authors(book_id);

// Para mostrar información de libros en pantalla
CREATE INDEX idx_books_publisher_id ON books(publisher_id);
CREATE INDEX idx_book_images_book_id ON book_images(book_id);
CREATE INDEX idx_purchase_links_book_id ON purchase_links(book_id);

// Para mostrar favoritos en biblioteca personal
CREATE INDEX idx_favorites_user_id ON favorites(user_id);