import React            from 'react';
import { connect }      from 'react-redux';
//import Header           from '../layouts/header';

class AuthenticatedContainer extends React.Component {
  componentDidMount() {
    const { dispatch, currentUser } = this.props;

    if (localStorage.getItem('phoenixAuthToken')) {
      dispatch(Actions.currentUser());
    } else {
      dispatch(routeActions.push('/sign_up'));
    }
  }

  render() {
    const { currentUser, dispatch, socket } = this.props;

    if (!currentUser) return false;

    return (
      <div id="authentication_container" className="application-container">
        <Header/>

        <div className='main-container'>
          {this.props.children}
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state) => ({
  currentUser: state.session.currentUser,
  socket: state.session.socket,
  channel: state.session.channel,
  
});

export default connect(mapStateToProps)(AuthenticatedContainer);
