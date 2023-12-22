#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
import json


# In[1]:

#load json file function
def load_file_json(path):
    with open(path,'r') as load_f:
        file=json.load(load_f)
    return file

#load txt like file function
def read_data_from_file(file_path):
    with open(file_path, 'r') as file:
        data = file.readlines()
    return data

def get_common_list(df_ref,df_iso):
    iso_list=list(set([isoform.split('-')[0] for isoform in df_iso['isoform']]))
    ref_list=list(set(list(df_ref['reference'])))
    common_list=list(set(iso_list).intersection(set(ref_list)))
    return common_list


# In[4]:


def combine_df_dic(df,common_list,dic_metric,isoform=True):
    dic_combined={}
    for entry in dic_metric.keys():
        if isoform==True:
            if entry.split('-')[0] in common_list and entry in list(df['isoform']):
                dic_combined[entry]=dic_metric[entry]
        else:
            if entry in common_list:
                dic_combined[entry]=dic_metric[entry]
    return dic_combined


# In[5]:


def combine_quality_metric(df_ref,df_iso,dic_ref,dic_iso,dic_diff):
    common_list=get_common_list(df_ref,df_iso)
    dic_iso_qua = combine_df_dic(df_iso,common_list,dic_iso)
    dic_ref_qua = combine_df_dic(df_ref,common_list,dic_ref,isoform=False)
    dic_diff_qua = combine_df_dic(df_iso,common_list,dic_diff)
    return dic_iso_qua,dic_ref_qua,dic_diff_qua


# In[2]:


def combine_dic(dic_1,dic_2):
    combined_dic={}
    for key in dic_1.keys():
        if key in dic_2.keys():
            combined_dic[key]=[dic_2[key],dic_1[key]]
    return combined_dic


# In[3]:


def combine_quality_type(quality_isoform_dic,quality_difference_dic,type_dic):
    isoform_type_dic=combine_dic(type_dic,quality_isoform_dic)
    difference_type_dic=combine_dic(type_dic,quality_difference_dic)
    return isoform_type_dic,difference_type_dic


# In[7]:


def replace_as(plot_df,column_name):
    as_name_dic={'exon_skipping':'Exon skipping',
                 'alternative_donor_site':'Alternative donor site',
                 'alternative_acceptor_site':'Alternative acceptor site',
                 'mutually_exclusive_exon':'Mutually exclusive exon',
                 'intron_retention':'Intron retention',
                 'alternative_first_exon':'Alternative first exon',
                 'alternative_last_exon':'Alternative last exon',
                 'mutually_exclusive_exon-alternative_first_exon':'Mutually exclusive exon Alternative first exon',
                 'mutually_exclusive_exon-alternative_last_exon':'Mutually exclusive exon Alternative last exon'}
    for index in range(len(plot_df)):
        as_ori=plot_df[column_name][index]
        plot_df[column_name][index]=as_name_dic[as_ori]
    return plot_df

def replace_as_abb(plot_df,column_name):
    as_name_dic={'exon_skipping':'ES',
                 'alternative_donor_site':'ADS',
                 'alternative_acceptor_site':'AAS',
                 'mutually_exclusive_exon':'MXE',
                 'intron_retention':'IR',
                 'alternative_first_exon':'AFE',
                 'alternative_last_exon':'ALE',
                 'mutually_exclusive_exon-alternative_first_exon':'MXE-AFE',
                 'mutually_exclusive_exon-alternative_last_exon':'MXE-ALE'}
    for index in range(len(plot_df)):
        as_ori=plot_df[column_name][index]
        plot_df[column_name][index]=as_name_dic[as_ori]
    return plot_df
# In[ ]:




