import { dependenciesTest } from '../test-utils/dependenciesTest';

describe('dependencies:bash', () => {
  const execaOptions = { shell: '/bin/bash' };
  dependenciesTest(execaOptions);
});

describe('dependencies:fish', () => {
  const execaOptions = { shell: '/usr/bin/fish' };
  dependenciesTest(execaOptions);
});
