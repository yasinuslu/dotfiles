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

  it('java should be available', async () => {
    const result = await execa(`java -version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('java home should be set correctly', async () => {
    const result = await execa(`echo $JAVA_HOME`, execaOptions);
    expect(result.stdout).toBeTruthy();
  });

  it('fzf should be available', async () => {
    const result = await execa(`fzf --version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('lsd should be available', async () => {
    const result = await execa(`lsd --version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('docker-compose should be available', async () => {
    const result = await execa(`docker-compose --version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('jq should be available', async () => {
    const result = await execa(`jq --version`, execaOptions);
    expect(result.code).toEqual(0);
  });

  it('bat should be available', async () => {
    const result = await execa(`bat --version`, execaOptions);
    expect(result.code).toEqual(0);
  });
}
