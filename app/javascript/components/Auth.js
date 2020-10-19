import React from "react"
import PropTypes from "prop-types"
class Auth extends React.Component {
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
          <label class="label">Password</label>
          <div class="control has-icons-right">
            <input class="input" type="password" data-enpassusermodified="yes" />
            <span class="icon is-small is-right">
              <i class="fa fa-key"></i>
            </span>
          </div>
        </div>
        <div class="has-text-centered">
          <a class="button is-vcentered is-primary is-outlined">Login</a>
        </div>
        <div class="has-text-centered">
          <a href="/register"> Don't you have an account? Sign up now!</a>
        </div>
      </React.Fragment>
    );
  }
}

Auth.propTypes = {
  username: PropTypes.string,
  email: PropTypes.string,
  password: PropTypes.string
};
export default Auth
