<!-- templates/book-list.php -->
<h2 class="book-details-title">Book Details:</h2>
<ul class="book-list">
    <?php if (isset($data['items']) && is_array($data['items'])): ?>
        <?php foreach ($data['items'] as $book): ?>
            <li class="book-item">
                <strong class="publication-id">PublicationId:</strong>
                <?= htmlspecialchars(isset($book['currentPublicationId']) ? $book['currentPublicationId'] : 'undefined') ?><br>
                <strong class="book-title">Title:</strong>
                <?= htmlspecialchars(isset($book['publications'][0]['fullTitle']['en_US']) ? $book['publications'][0]['fullTitle']['en_US'] : 'Untitled') ?><br>
                <strong class="book-abstract">Abstract:</strong>
                <?= htmlspecialchars(isset($book['publications'][0]['chapters'][0]['abstract']['en_US']) ? $book['publications'][0]['chapters'][0]['abstract']['en_US'] : 'undefined') ?><br>
                <strong class="book-coverImage">coverImage:</strong>
                <!-- <?= htmlspecialchars(isset($book['publications'][0]['coverImage']['en_US']) ? $book['publications'][0]['coverImage']['en_US'] : 'unknown cover') ?><br>
                <strong class="book-author">Author(s):</strong> -->
                <?= htmlspecialchars(isset($book['publications'][0]['authorsStringShort']) ? $book['publications'][0]['authorsStringShort'] : 'unknown author') ?><br>
                <strong class="book-date">Date Published:</strong>
                <?= htmlspecialchars(isset($book['publications'][0]['datePublished']) ? $book['publications'][0]['datePublished'] : 'date published not found') ?><br>
            </li>
        <?php endforeach; ?>
    <?php else: ?>
        <p>No books found.</p>
    <?php endif; ?>


</ul>