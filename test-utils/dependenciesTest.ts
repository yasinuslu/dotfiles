import execa from 'execa';

export function dependenciesTest(execaOptions: execa.Options) {
  it('node should be available', async () => {
    const result = await execa(`node --version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('npm should be available', async () => {
    const result = await execa(`npm --version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('yarn should be available', async () => {
    const result = await execa(`yarn --version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('go should be available', async () => {
    const result = await execa(`go version`, execaOptions);
    expect(result.code).toEqual(0);
  });
}
