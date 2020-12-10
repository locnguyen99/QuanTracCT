import React from 'react'

import 'antd/dist/antd.css'
import Signup from './Signup'
import AppLayout from './AppLayout'
import Home from './Components/Home'
import CongTrinh from './Components/CongTrinh'
import Signin, { LoginLayout } from './Signin'
import { EditableTable } from './Components/EditableTable'
import ChiTietCongTrinh from './Components/ChiTietCongTrinh'
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'

function App() {
	return (
		<Router>
			<Switch>
				<Route path='/auth'>
					<LoginLayout>
						<Switch>
							<Route path='/auth' exact component={Signin} />
							<Route path='/auth/signup' component={Signup} />
							<Route path='/*' component={AuthNotFoundPage} />
						</Switch>
					</LoginLayout>
				</Route>

				<Route path='/'>
					<AppLayout>
						<Switch>
							<Route path='/' exact component={Home} />
							<Route path='/cong-trinh' exact component={CongTrinh} />
							<Route path='/cong-trinh/:MaCT' component={ChiTietCongTrinh} />
							<Route path='/cong-trinh-chi-tiet' component={EditableTable} />
							<Route path='/*' component={NotFoundPage} />
						</Switch>
					</AppLayout>
				</Route>
			</Switch>
		</Router>
	)
}

class NotFoundPage extends React.Component {
	render() {
		return (
			<div>Not found</div>
		)
	}
}
class AuthNotFoundPage extends React.Component {
	render() {
		return (
			<div>Auth Not found</div>
		)
	}
}
export default App
//setInterval(App, 1000) goi ham or biểu thức chạy trong số giây quy định, sau đó dừng tiến trình khi hết giờ
//https://css-tricks.com/snippets/css/a-guide-to-flexbox/
