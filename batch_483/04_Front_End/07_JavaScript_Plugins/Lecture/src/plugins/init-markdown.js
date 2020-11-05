import MarkdownIt from 'markdown-it';

const handleTextareaKeyup = (event) => {
  const md = new MarkdownIt();
  const preview = document.getElementById('preview');
  const result = md.render(event.target.value);
  preview.innerHTML = result;
};

const initMarkdownConverter = () => {
  const textarea = document.getElementById('editor');
  textarea.addEventListener('keyup', handleTextareaKeyup);
};

export { initMarkdownConverter };
