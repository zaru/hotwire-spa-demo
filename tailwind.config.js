module.exports = {
  mode: 'jit',
  purge: {
    content: [
      './app/views/**/*.html.erb',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.js'
    ],
    safelist: [
      {
        pattern: /bg-/,
      },
      {
        pattern: /text-/,
      }
    ],
  },
  theme: {
  }
}
