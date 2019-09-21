import React from 'react'

// Import typefaces
import 'typeface-montserrat'
import 'typeface-merriweather'

import profilePic from './profile-pic.jpg'
import { rhythm } from '../utils/typography'

class Bio extends React.Component {
  render() {
    return (
      <div
        style={{
          display: 'flex',
          marginBottom: rhythm(2.5),
        }}
      >
        <img
          src={profilePic}
          alt={`huang huan`}
          style={{
            marginRight: rhythm(1 / 2),
            marginBottom: 0,
            width: rhythm(2),
            height: rhythm(2),
          }}
        />
        <p>
          <strong>黄欢 - 神经网络进击中</strong>{' '}
          <a href="https://twitter.com/huan_huang">
            twitter
          </a>
          &nbsp;
          <a href="mailto:hhhust@gmail.com">
            mail
          </a>
        </p>
      </div>
    )
  }
}

export default Bio
