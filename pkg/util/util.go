package util

import (
	"strconv"
	"strings"
)

func Htons(i uint16) uint16 {
	return (i<<8)&0xff00 | i>>8
}

func ParseAddr(addr string) (ip string, port int) {
	as := strings.Split(addr, ":")
	ip = as[0]
	port, _ = strconv.Atoi(as[1])
	return
}
