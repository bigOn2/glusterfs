/*
 * Copyright (c) 2012 Red Hat, Inc. <http://www.redhat.com>
 * This file is part of GlusterFS.
 *
 * This file is licensed to you under your choice of the GNU Lesser
 * General Public License, version 3 or any later version (LGPLv3 or
 * later), or the GNU General Public License, version 2 (GPLv2), in all
 * cases as published by the Free Software Foundation.
 */

#ifdef RPC_XDR
%#include "rpc-pragmas.h"
#endif
%#include "compat.h"

/* This file has definition of few XDR structures which are
 * not captured in any section specific file */

%#include "xdr-common.h"
%#include "glusterfs-fops.h"

struct auth_glusterfs_parms_v2 {
        int pid;
        unsigned int uid;
        unsigned int gid;
        unsigned int groups<>;
        opaque lk_owner<>;
};

struct auth_glusterfs_parms {
        u_quad_t lk_owner;
        unsigned int pid;
        unsigned int uid;
	unsigned int gid;
	unsigned int ngrps;
	unsigned groups[16];
};

struct gf_dump_req {
	u_quad_t gfs_id;
};

struct gf_statedump {
	unsigned int pid;
};

struct gf_prog_detail {
	string progname<>;
	u_quad_t prognum;
	u_quad_t progver;
	struct gf_prog_detail *next;
};


struct gf_dump_rsp {
        u_quad_t gfs_id;
        int op_ret;
	int op_errno;
	struct gf_prog_detail *prog;
};


struct gf_common_rsp {
       int    op_ret;
       int    op_errno;
       opaque   xdata<>; /* Extra data */
} ;


union gfx_value switch (gf_dict_data_type_t type) {
        case GF_DATA_TYPE_INT:
                hyper value_int;
        case GF_DATA_TYPE_UINT:
                unsigned hyper value_uint;
        case GF_DATA_TYPE_DOUBLE:
                double value_dbl;
        case GF_DATA_TYPE_STR:
                opaque val_string<>;
};

struct gfx_dict_pair {
       opaque key<>;
       gfx_value value;
};

struct gfx_dict {
       unsigned int count;
       gfx_dict_pair pairs<>;
};
