document.addEventListener('DOMContentLoaded', () => {
  let content = `
  .emoji[style*="a.slack-edge.com"] { background-image: url("https://github.com/Fdebijl/LessAwfulEmoji/raw/master/img/sheet_facebook_64_indexed_256.png") !important; }
  .emoji-outer[style*="a.slack-edge.com"] { background-image: url("https://github.com/Fdebijl/LessAwfulEmoji/raw/master/img/sheet_facebook_64_indexed_256.png") !important; }
  `
  $("<style class='EmojiSelectorInjector'></style>").appendTo('head').html(content);
});
