package com.eproc.dao;

import com.eproc.domain.JnlpStatus;

public interface JnlpStatusDao {
    
    void saveJnlpEntry(JnlpStatus jnlpStatus);

    public JnlpStatus fetchJnlpStatus(String randomNo);

    public String fetchJnlpStatusByRandomNo(String randomNo);
}
