import { describe, expect, it } from 'vitest';
import { version } from '../src/index.js';

describe('quanttide-tech', () => {
  it('exposes the package version', () => {
    expect(version).toBe('0.1.0');
  });
});
