/* eslint-env mocha */

import { expect } from 'chai';
import FeedbackStore from "../../stores/FeedbackStore";

describe('FeedbackStore', () => {
  let feedbackStore;
  beforeEach(() => {
    feedbackStore = new FeedbackStore();
  });

  it('should initialize correctly', () => {
    expect(feedbackStore.name).to.equal('');
    expect(feedbackStore.feedback).to.equal('');
  });

  it('setName', () => {
    feedbackStore.setName('Peter');
    expect(feedbackStore.name).to.equal('Peter');
  });

  it('setFeedback', () => {
    feedbackStore.setFeedback('GREAT job!');
    expect(feedbackStore.feedback).to.equal('GREAT job!');
  });
});
