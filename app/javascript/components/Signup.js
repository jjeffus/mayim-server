import React from "react"
import PropTypes from "prop-types"
class Signup extends React.Component {
  render () {
    return (
      <React.Fragment>
      <div class="field">
        <label class="label">Username</label>
        <div class="control has-icons-right">
          <input class="input" type="text" />
          <span class="icon is-small is-right">
            <i class="fa fa-user"></i>
          </span>
        </div>
      </div>
      <div class="field">
        <label class="label">Email</label>
        <div class="control has-icons-right">
        <input class="input" type="text" data-enpassusermodified="yes" />
        <span class="icon is-small is-right">
          <i class="fa fa-envelope"></i>
        </span>
        </div>
      </div>
      <div class="field">
        <label class="label">Password</label>
        <div class="control has-icons-right">
          <input class="input" type="password" data-enpassusermodified="yes" />
          <span class="icon is-small is-right">
            <i class="fa fa-key"></i>
          </span>
        </div>
      </div>
      <div class="has-text-centered">
        <a class="button is-vcentered is-primary is-outlined">Sign Up</a>
      </div>
      <div class="has-text-centered">
        <a href="/signin">Already have an account? Log in now !</a>
      </div>
      </React.Fragment>
    );
  }
}

export default Signup
