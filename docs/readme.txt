// setup tailwind

npm install tailwindcss postcss autoprefixer
npx tailwindcss init
npm install -D tailwindcss

// postcss.config.js
module.exports = {
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
  ],
};

npm run tailwindcss