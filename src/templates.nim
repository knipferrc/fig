type Template* = object
  filename*: string
  content*: string

const reactJavascriptTemplate* = @[
  Template(
    filename: ".prettierrc.js",
    content: """
    module.exports = {
      trailingComma: "all",
      singleQuote: true,
      semi: true,
    };
    """
  ),
  Template(
    filename: ".editorconfig",
    content: """
    root = true

    [*]
    charset = utf-8
    indent_style = space
    indent_size = 2
    end_of_line = lf
    insert_final_newline = true
    trim_trailing_whitespace = true

    [*.md]
    trim_trailing_whitespace = false
    """
  ),
  Template(
    filename: ".prettierignore",
    content: """
    node_modules/
    dist/
    build/
    """
  )
]

const reactTypescriptTemplate* = @[
  Template(
    filename: ".prettierrc.js",
    content: """
    module.exports = {
      trailingComma: "all",
      singleQuote: true,
      semi: true,
    };
    """
  ),
  Template(
    filename: ".editorconfig",
    content: """
    root = true

    [*]
    charset = utf-8
    indent_style = space
    indent_size = 2
    end_of_line = lf
    insert_final_newline = true
    trim_trailing_whitespace = true

    [*.md]
    trim_trailing_whitespace = false
    """
  ),
  Template(
    filename: ".prettierignore",
    content: """
    node_modules/
    dist/
    build/
    """
  ),
  Template(
    filename: ".eslintrc.js",
    content: """
    module.exports = {
      parser: '@typescript-eslint/parser',
      extends: [
        'eslint:recommended',
        'plugin:react/recommended',
        'plugin:@typescript-eslint/recommended',
        'prettier/@typescript-eslint',
        'plugin:prettier/recommended',
        'plugin:jsx-a11y/recommended',
        'plugin:import/typescript',
      ],
      plugins: [
        '@typescript-eslint',
        'react',
        'prettier',
        'react-hooks',
        'jsx-a11y',
        'import',
      ],
      env: {
        browser: true,
        node: true,
      },
      parserOptions: {
        ecmaVersion: 2018,
        sourceType: 'module',
        ecmaFeatures: {
          jsx: true,
        },
      },
      rules: {
        'import/order': ['warn', { 'newlines-between': 'always' }],
        '@typescript-eslint/explicit-function-return-type': 'off',
        '@typescript-eslint/no-unused-vars': 'off',
        '@typescript-eslint/triple-slash-reference': 'off',
        '@typescript-eslint/no-explicit-any': 'off',
        '@typescript-eslint/no-empty-interface': 'warn',
        'react/no-direct-mutation-state': 'off',
        'react/no-deprecated': 'off',
        'react/no-string-refs': 'off',
        'react/require-render-return': 'off',
        'react/jsx-filename-extension': [
          'warn',
          {
            extensions: ['.jsx', '.tsx'],
          },
        ],
        'react/prop-types': 'off',
        'react/display-name': 'off',
        '@typescript-eslint/no-unused-vars': ['warn', { ignoreRestSiblings: true }],
        'react-hooks/rules-of-hooks': 'error',
        'react-hooks/exhaustive-deps': 'warn',
        'newline-before-return': 'warn',
        'prefer-const': 'warn',
        'no-console': 'warn',
        'prettier/prettier': 'warn',
      },
      settings: {
        react: {
          version: 'detect',
        },
      },
    };
    """
  )
]

const svelteTemplate* = @[
  Template(
    filename: ".prettierrc.js",
    content: """
    module.exports = {
      trailingComma: "all",
      singleQuote: true,
      semi: true,
      plugins: ["svelte"]
    };
    """
  ),
  Template(
    filename: ".editorconfig",
    content: """
    root = true

    [*]
    charset = utf-8
    indent_style = space
    indent_size = 2
    end_of_line = lf
    insert_final_newline = true
    trim_trailing_whitespace = true

    [*.md]
    trim_trailing_whitespace = false
    """
  ),
  Template(
    filename: ".prettierignore",
    content: """
    node_modules/
    dist/
    build/
    """
  ),
  Template(
    filename: ".eslintrc.js",
    content: """
    module.exports = {
    extends: ["eslint:recommended"],
    plugins: ["svelte3"],
    env: {
      es6: true,
      browser: true,
      node: true
    },
    parserOptions: {
      ecmaVersion: 2019,
      sourceType: "module"
    },
    overrides: [
      {
        files: ["**/*.svelte"],
        processor: "svelte3/svelte3"
      }
    ],
    rules: {
      "newline-before-return": "warn",
      "prefer-const": "warn",
      "no-console": "warn",
      "no-unused-vars": "warn"
    },
    settings: {}
  };
  """    
  )
]