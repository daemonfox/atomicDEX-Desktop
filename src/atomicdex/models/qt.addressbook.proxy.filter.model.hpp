/******************************************************************************
 * Copyright © 2013-2019 The Komodo Platform Developers.                      *
 *                                                                            *
 * See the AUTHORS, DEVELOPER-AGREEMENT and LICENSE files at                  *
 * the top-level directory of this distribution for the individual copyright  *
 * holder information and the developer policies on copyright and licensing.  *
 *                                                                            *
 * Unless otherwise agreed in a custom licensing agreement, no part of the    *
 * Komodo Platform software, including this file may be copied, modified,     *
 * propagated or distributed except according to the terms contained in the   *
 * LICENSE file                                                               *
 *                                                                            *
 * Removal or modification of this copyright notice is prohibited.            *
 *                                                                            *
 ******************************************************************************/

#pragma once

//! Qt
#include <QSortFilterProxyModel>

namespace atomic_dex
{
    class addressbook_proxy_model final : public QSortFilterProxyModel
    {
        Q_OBJECT
        
    public:
        //! Constructor
        addressbook_proxy_model(QObject* parent);

        //! Destructor
        ~addressbook_proxy_model() final = default;

    protected:
        /// QSortFilterProxyModel functions
        ///////////////////////////////////
        
        [[nodiscard]]
        bool lessThan(const QModelIndex& source_left, const QModelIndex& source_right) const final;
    
        /////////////////////////////////////////
    };
} // namespace atomic_dex
