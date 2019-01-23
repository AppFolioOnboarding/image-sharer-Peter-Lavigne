import { action, observable } from 'mobx';

export class FeedbackStore {
  @observable name = "";
  @observable feedback = "";

  @action
  setName = (name) => {
    this.name = name;
  };

  @action
  setFeedback = (feedback) => {
    this.feedback = feedback;
  };
}

export default FeedbackStore;
