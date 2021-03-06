#!/usr/bin/env python
# -*- coding: utf-8 -*-
#################################################################################
# Copyright (c) 2018 Tsinghua Institute of Geo-Environment. All Rights Reserved #
#################################################################################
"""
File: GasConstant.py
Date: 2018/08/28 21:32:53
Desc: 气体常数类
"""

import os
import logging
import configparser


class GasConstant(object):
    """
    网络配置文件处理类
    """
    def __init__(self, config_file='../config/config.ini'):
        """
        初始化
        :param config_file: 配置文件，默认位置'../config/config.ini'
        """
        if not os.path.exists(config_file):
            logging.error("No gas config file detected!")
            raise Exception("No gas config file detected!")
        conf = configparser.ConfigParser()
        conf.read(config_file, encoding='utf-8-sig')

        # 读取具体配置
        try:
            # self.M
            self.M = float(conf.get("gas", "M"))
            if self.M <= 0:
                raise Exception("param gas.M should be positive!")

            # self.R
            self.R = float(conf.get("gas", "R"))
            if self.R <= 0:
                raise Exception("param gas.R should be positive!")

            # self.T
            self.T = float(conf.get("gas", "T"))
            if self.T <= 0:
                raise Exception("param gas.T should be positive!")

            # self.u
            self.u = float(conf.get("gas", "u"))
            if self.u <= 0:
                raise Exception("param gas.u should be positive!")

            self.print_config()

        except Exception as e:
            logging.error("Load config fail: [" + str(e) + "]")
            raise Exception("Load config fail: [" + str(e) + "]")

    def print_config(self):
        """
        打印当前的配置
        :return:
        """
        logging.info("------------------读取气体参数配置文件------------------")
        logging.info("摩尔质量M(kg/mol): " + str(self.M))
        logging.info("气体常数R(m^3·Pa/(K·mol)): " + str(self.R))
        logging.info("温度T(K): " + str(self.T))
        logging.info("粘度u(Pa·s): " + str(self.u))


if __name__ == '__main__':
    gas_constant = GasConstant()
