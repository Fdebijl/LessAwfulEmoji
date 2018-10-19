document.addEventListener('DOMContentLoaded', () => {
  let content = `
  .emoji[style*="a.slack-edge.com"] { background-image: url("https://a.slack-edge.com/c00d19/img/emoji_2017_12_06/sheet_google_64_indexed_256.png") !important; }
  .emoji-outer[style*="a.slack-edge.com"] { background-image: url("https://a.slack-edge.com/c00d19/img/emoji_2017_12_06/sheet_google_64_indexed_256.png") !important; }
  `
  $("<style class='EmojiSelectorInjector'></style>").appendTo('head').html(content);
});
