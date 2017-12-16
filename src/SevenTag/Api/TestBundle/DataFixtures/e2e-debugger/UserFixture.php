<?php
/**
 * Copyright (C) 2015 Digimedia Sp. z o.o. d/b/a Clearcode
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

namespace SevenTag\Api\TestBundle\DataFixtures\e2eDebugger;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use SevenTag\Api\UserBundle\Entity\User;
use SevenTag\Component\User\Model\UserInterface;

/**
 * Class UserFixture
 * @package SevenTag\Api\TestBundle\DataFixtures\e2eDebugger
 */
class UserFixture extends AbstractFixture implements OrderedFixtureInterface
{
    const REFERENCE_NAME = 'user';

    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $users = $this->getData();

        foreach ($users as $id => $data) {
            $user = new User();
            $user->setUsername($data['username']);
            $user->setFirstName(sprintf('FirstName %s', $data['username']));
            $user->setLastName(sprintf('LastName %s', $data['username']));
            $user->setEmail($data['email']);
            $user->setEnabled($data['enabled']);
            $user->setPlainPassword($data['password']);

            if (isset($data['roles'])) {
                $user->setRoles($data['roles']);
            }

            if (isset($data['confirmationToken'])) {
                $user->setConfirmationToken($data['confirmationToken']);
            }

            if (isset($data['passwordRequestedAt'])) {
                $user->setPasswordRequestedAt($data['passwordRequestedAt']);
            }

            $manager->persist($user);
            $this->addReference(sprintf(
                '%s_%s',
                self::REFERENCE_NAME,
                $id
            ), $user);

        }

        $manager->flush();
    }

    /**
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 0;
    }

    /**
     * @return array
     */
    private function getData()
    {
        return [[
            'username' => 'user1',
            'password' => 'testing',
            'email' => 'user1@example.com',
            'roles' => [UserInterface::ROLE_SUPER_ADMIN, UserInterface::ROLE_CONTAINERS_CREATE],
            'enabled' => true
        ]];
    }
}
