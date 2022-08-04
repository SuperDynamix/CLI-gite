#!/usr/bin/env node
const fs=require('fs')
const path = require('path');

let fileName='logs/push_err.log'
const regx=/git pull/
fs.readFile(fileName,(err,data)=>{
  if(err) throw err
  let dataAsString=data.toString().match(regx)
  if(dataAsString != null)
    console.log('fetch')
  else
    console.log('err')
})
