module.exports = {
  extends: [
    'airbnb-base',
    'plugin:@typescript-eslint/recommended',
    'plugin:jest/recommended',
    'plugin:prettier/recommended',
    'prettier/@typescript-eslint',
  ],
  rules: {
    'import/no-extraneous-dependencies': [
      'error',
      { devDependencies: ['test/**/*.ts'] },
    ],
    '@typescript-eslint/explicit-function-return-type': 'off',
    '@typescript-eslint/no-explicit-any': 'off',
    'max-len': ['error', { code: 100 }], // 120 is too much for macbook
    'import/prefer-default-export': 'off', // typescript community doesn't like default exports
  }
};
