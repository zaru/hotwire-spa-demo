module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    boxShadow: {
      'inner-top-border': '0 3px 2px -3px rgba(0, 0, 0, 0.2) inset'
    }
  }
}
